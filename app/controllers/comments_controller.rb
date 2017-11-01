class CommentsController < ApplicationController


  def create
    # Blogをパラメータの値から探し出し,Blogに紐づくcommentsとしてbuildします。
    @comment = current_user.comments.build(comment_params)
    @blog = @comment.blog
    @notification = @comment.notifications.build(user_id: @blog.user.id)
    respond_to do |format|
      if @comment.save
        format.html {redirect_to blog_path(@blog), notice: "コメントを投稿しました！"}
        format.js {render :index}

          unless @comment.blog.user_id == current_user.id
            Pusher.trigger("user_#{@comment.blog.user_id}_channel", 'comment_created',{
              message:'あなたの作成したブログにコメントが付きました！'
            })
            Pusher.trigger("user_#{@comment.blog.user_id}_channel", 'notification_created',{
              unread_counts: Notification.where(user_id: @comment.blog.user.id, read:false).count
            })
          end

      else
        format.html {render :new}
      end
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @blog = @comment.blog
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to blog_path(@comment.blog)
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @blog = @comment.blog

    respond_to do |format|
      if @comment.destroy
        format.html {redirect_to blog_path(@blog), notice: "コメントを削除しました！"}
        format.js {render :index}
      else
        format.html {render :new}
      end
    end
  end


  private
    def comment_params
      params.require(:comment).permit(:blog_id, :content)
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end
end

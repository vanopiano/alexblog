# coding: utf-8
class CommentsController < ApplicationController
      def create
        I18n.locale = :ru
        @comment_hash = params[:comment]
        @obj = @comment_hash[:commentable_type].constantize.find(@comment_hash[:commentable_id])
        # Not implemented: check to see whether the user has permission to create a comment on this object
        @comment = Comment.build_from(@obj, current_user.id, @comment_hash[:body])
        if @comment.save
          render :partial => "comments/comment", :locals => { :comment => @comment }, :layout => false, :status => :created
        else
        	render :partial => "comments/error", :layout => false, :status => :created
          #render :js => "alert('Заполните текст комментария');"
        end
      end
      def destroy
        @comment = Comment.find(params[:id])
        if @comment.destroy
          render :json => @comment, :status => :ok
        else
          render :js => "alert('Не удается удалить комментарий');"
        end
      end
    end

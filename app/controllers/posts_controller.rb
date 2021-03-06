#coding: utf-8
class PostsController < ApplicationController
  
  before_filter :authenticate_user!, :only => [:new, :edit, :destroy] 
  before_filter :aftorise_admin, :only => [:new, :edit, :destroy]
    
  # GET /posts
  # GET /posts.json
  def index
	@title = "Все записи"
    @posts = Post.paginate(:page => params[:page], :per_page => 6).order('created_at DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  	@post = Post.find(params[:id])
  	@title = @post.title
        @comments = @post.comment_threads.order('created_at desc')
#        @comments = @post.comment_threads.paginate(:page => params[:page], :per_page => 20).order('created_at DESC')
    if (current_user)
      @new_comment = Comment.build_from(@post, current_user.id, "")
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = current_user.posts.new(params[:post])
    @title = "Новая запись"
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    @title = "Редактировать запись: "+@post.title
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Запись успешно создана.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Запись обновлена.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy

    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end

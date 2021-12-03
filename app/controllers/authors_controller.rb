class AuthorsController < ApplicationController
  def index 
    authors= Author.all
    render json: authors
  end

  def show 
    author = Author.find_by(id: params[:id])
    render json: author
  end

  def create 
    author= Author.create!(author_params)
    render json: {message: 'created', author: author}
  end

  def update 
    author= Author.find(params[:id])
    author.update!(author_params)
    render json: {message: 'updated', author: author}

  rescue StandardError => e
    render json: {message: 'can not be updated !'}
  end

  def destroy 
    author= Author.find_by(id: params[:id])

    if author.present?
        author.destroy
        render json: {message: "Deletion Success!"}
    else 
        render json: {message: "Deletion Failed!"}
    end
  end

  private
  def author_params
    params.permit(:name, :bio)
  end

end

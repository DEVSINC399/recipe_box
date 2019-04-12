class RecipesController < ApplicationController
    before_action :set_recipe, only: [:show, :edit, :update, :destroy]

    def index
        @recipes = Recipe.all.order("created_at desc")
    end

    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = Recipe.new(recipe_params)
        if @recipe.save
            redirect_to @recipe, notice: "Record has been saved successfully."
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if @recipe.update(recipe_params)
            redirect_to root_path, notice: "Record updated successfully."
        else
            render 'edit'
        end
    end

    def destroy
        @recipe.destroy
        redirect_to root_path, notice: "Record deleted successfully."
    end

    private
        def recipe_params
            params.require(:recipe).permit(:title, :description, :user_id)
        end

        def set_recipe
            @recipe = Recipe.find(params[:id])
        end
end

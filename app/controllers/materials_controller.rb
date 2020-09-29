class MaterialsController < ApplicationController
  before_action :authenticate_user!

  def index
    set_material
  end

  def create
    @addmaterial = Material.new(params_material)
    add_name = params[:material][:name]
    exist_name = current_user.materials.pluck(:name)
    protein = params[:material][:protein]
    carbo = params[:material][:carbohydrate]
    fat = params[:material][:fat]
    if params[:material][:genre_id].empty?
      flash[:error] = "ジャンルが選択されていません"
      set_material
    elsif exist_name.include?(add_name)
      flash[:error] = "登録済の材料です"
      set_material
    elsif protein == "" || carbo == "" || fat == ""
      flash[:error] = "入力されていない項目があります"
      set_material
    else
      @addmaterial.genre_id = @addmaterial.genre.id
      @addmaterial.user_id = current_user.id
      @addmaterial.calorie = Material.calorie_fit(@addmaterial.fat, @addmaterial.protein, @addmaterial.carbohydrate)
      @addmaterial.save
      set_material
      flash[:notice] = "材料を登録しました"
    end
  end

  def destroy
    material = Material.find_by(id: params[:id], genre_id: params[:genre_id])
    material.destroy
    set_material
    flash[:notice] = "削除しました"
  end

  def search
    @addmaterial = Material.new
    if @genre = Genre.find_by(id: params[:genre_id])
      @materials = Material.where(user_id: current_user.id, genre_id: @genre.id).page(params[:page]).per(6)
      render "index"
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def params_material
    params.require(:material).permit(:user_id, :name, :genre_id, :fat, :protein, :carbohydrate, :calorie)
  end

  def set_material
    @addmaterial = Material.new
    @materials = current_user.materials.order("genre_id").page(params[:page]).per(6)
  end
end

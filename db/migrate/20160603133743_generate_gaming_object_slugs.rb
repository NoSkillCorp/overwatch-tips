class GenerateGamingObjectSlugs < ActiveRecord::Migration
  def change
    GamingObject.find_each(&:save)
  end
end

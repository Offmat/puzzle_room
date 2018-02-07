module UserHelper
  def most_popular_material(puzzles)
    all_materials = []
    puzzles.each do |puzzle|
      all_materials += puzzle.materials
    end
    all_materials = all_materials.group_by(&:name).max_by { |_k, v| v.length }.first
  end
end

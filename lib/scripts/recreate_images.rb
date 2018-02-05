Puzzle.all.each do |puzzle|
  puzzle.avatar.recreate_versions! if puzzle.avatar.present?
end

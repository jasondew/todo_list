Factory.define(:to_do) do |f|
  f.description "Something that must be done!"
  f.due_on { 3.days.from_now }
end

ActiveRecord::Schema.define(version: 20180704043426) do

  enable_extension "plpgsql"

  create_table "blogs", force: :cascade do |t|
    t.text "title"
    t.text "content"
  end

end

class CreateInitialTables < ActiveRecord::Migration
  def change
    create_table(:shoes) do |a|
      a.column(:title, :string)

      a.timestamps()
    end

    create_table(:stores) do |b|
      b.column(:title, :string)

      b.timestamps()
    end

    create_table(:shoes_stores) do |ab|
      ab.column(:shoe_id, :int)
      ab.column(:store_id, :int)

      ab.timestamps()
    end
  end
end

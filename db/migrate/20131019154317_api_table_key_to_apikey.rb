class ApiTableKeyToApikey < ActiveRecord::Migration
  def up
  	rename_column :apis, :key, :api_key
  end

  def down
  end
end

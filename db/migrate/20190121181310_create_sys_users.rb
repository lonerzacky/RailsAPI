class CreateSysUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :sys_users do |t|

      t.timestamps
    end
  end
end

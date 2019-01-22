# frozen_string_literal: true

class SysUser < ApplicationRecord
  self.table_name = 'sys_user'
  self.primary_key = 'sysuser_id'
end

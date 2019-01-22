# frozen_string_literal: true

require 'composite_primary_keys'
class SysRmodul < ApplicationRecord
  self.table_name = 'sys_rmodul'
  self.primary_key = :sysrole_kode, :sysmodul_kode
end

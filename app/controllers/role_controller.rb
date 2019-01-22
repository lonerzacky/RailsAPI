require './helpers/utility'
class RoleController < ApplicationController

  def index
    @sys_role = SysRole.all
    if @sys_role
      give_response('00', 'GET ROLE SUKSES', @sys_role)
    else
      give_response('01', 'GET ROLE GAGAL')
    end
  end

end

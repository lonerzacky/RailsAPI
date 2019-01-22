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

  def create
    sysrole_kode = params[:sysrole_kode]
    sysrole_nama = params[:sysrole_nama]
    @sys_role = SysRole.create(sysrole_kode: sysrole_kode, sysrole_nama: sysrole_nama)
    if @sys_role
      give_response("00", "INSERT ROLE SUKSES", @sys_role)
    else
      give_response("01", "INSERT ROLE GAGAL")
    end
  end

  def update
    sysrole_nama = params[:sysrole_nama]
    @sys_role = SysRole.find_by(sysrole_kode: params[:sysrole_kode])
    @sys_role.update(sysrole_nama: sysrole_nama)
    give_response("00", "UPDATE ROLE SUKSES", @sys_role)
  end

  def delete
    @sys_role = SysRole.find_by(sysrole_kode: params[:sysrole_kode])
    @sys_role.destroy
    give_response("00", "DELETE ROLE SUKSES")
  end

end

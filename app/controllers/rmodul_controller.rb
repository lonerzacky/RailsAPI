# frozen_string_literal: true

require './helpers/utility'
class RmodulController < ApplicationController
  def index
    @sys_rmodul = SysRmodul.all
    if @sys_rmodul
      give_response('00', 'GET ROLE MODUL SUKSES', @sys_rmodul)
    else
      give_response('01', 'GET ROLE MODUL GAGAL')
    end
  end

  def create
    sysrole_kode = params[:sysrole_kode]
    sysmodul_kode = params[:sysmodul_kode]
    @sys_rmodul = SysRmodul.create(sysrole_kode: sysrole_kode, sysmodul_kode: sysmodul_kode)
    if @sys_rmodul
      give_response('00', 'INSERT ROLE MODUL SUKSES', @sys_rmodul)
    else
      give_response('01', 'INSERT ROLE MODUL GAGAL')
    end
  end

  def delete
    sysrole_kode = params[:sysrole_kode]
    sysmodul_kode = params[:sysmodul_kode]
    @sys_rmodul = SysRmodul.find_by(sysrole_kode: sysrole_kode, sysmodul_kode: sysmodul_kode)
    @sys_rmodul.destroy
    give_response('00', 'DELETE ROLE MODUL SUKSES')
  end
end

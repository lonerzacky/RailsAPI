require './helpers/utility'
class ModulController < ApplicationController

  def index
    @sys_modul = SysModul.all
    if @sys_modul
      give_response("00", "GET MODUL SUKSES", @sys_modul)
    else
      give_response("01", "GET MODUL GAGAL")
    end
  end

  def create
    sysmodul_kode = params[:sysmodul_kode]
    sysmodul_nama = params[:sysmodul_nama]
    sysmodul_url = params[:sysmodul_url]
    sysmodul_icon = params[:sysmodul_icon]
    sysmodul_parent = params[:sysmodul_parent]
    if sysmodul_parent.blank?
      sysmodul_parent=nil
    end
    sysmodul_no_urut = params[:sysmodul_no_urut]
    @sys_modul = SysModul.create(sysmodul_kode: sysmodul_kode, sysmodul_nama: sysmodul_nama,
                                 sysmodul_url: sysmodul_url, sysmodul_icon: sysmodul_icon,
                                 sysmodul_parent: sysmodul_parent, sysmodul_no_urut: sysmodul_no_urut)
    if @sys_modul
      give_response("00", "INSERT MODUL SUKSES", @sys_modul)
    else
      give_response("01", "INSERT MODUL GAGAL")
    end
  end

  def update
    sysmodul_nama = params[:sysmodul_nama]
    sysmodul_url = params[:sysmodul_url]
    sysmodul_icon = params[:sysmodul_icon]
    sysmodul_parent = params[:sysmodul_parent]
    sysmodul_no_urut = params[:sysmodul_no_urut]
    if sysmodul_parent.blank?
      sysmodul_parent=nil
    end
    @sys_modul = SysModul.find_by(sysmodul_kode: params[:sysmodul_kode])
    @sys_modul.update(sysmodul_nama: sysmodul_nama, sysmodul_url: sysmodul_url,
                      sysmodul_icon: sysmodul_icon, sysmodul_parent: sysmodul_parent,
                      sysmodul_no_urut: sysmodul_no_urut)
    give_response("00", "UPDATE MODUL SUKSES", @sys_modul)
  end

  def delete
    @sys_modul = SysModul.find_by(sysmodul_kode: params[:sysmodul_kode])
    @sys_modul.destroy
    give_response("00", "HAPUS MODUL SUKSES")
  end

end

# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir D:/ESCOM/ARQUITECTURA/ProyectoFinal/Procesador/Procesador.cache/wt [current_project]
set_property parent.project_path D:/ESCOM/ARQUITECTURA/ProyectoFinal/Procesador/Procesador.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo d:/ESCOM/ARQUITECTURA/ProyectoFinal/Procesador/Procesador.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
add_files {{D:/ESCOM/ARQUITECTURA/ProyectoFinal/Procesador/Procesador.srcs/sources_1/imports/Burbuja Final/archivoReg.bmm}}
add_files {{D:/ESCOM/ARQUITECTURA/ProyectoFinal/Procesador/Procesador.srcs/sources_1/imports/Burbuja Final/pilax.bmm}}
read_vhdl -library xil_defaultlib {
  {D:/ESCOM/ARQUITECTURA/ProyectoFinal/Procesador/Procesador.srcs/sources_1/imports/Burbuja Final/components.vhd}
  {D:/ESCOM/ARQUITECTURA/ProyectoFinal/Procesador/Procesador.srcs/sources_1/imports/Burbuja Final/Componentes.vhd}
  {D:/ESCOM/ARQUITECTURA/ProyectoFinal/Procesador/Procesador.srcs/sources_1/imports/Burbuja Final/Condicion.vhd}
  {D:/ESCOM/ARQUITECTURA/ProyectoFinal/Procesador/Procesador.srcs/sources_1/imports/Burbuja Final/Control.vhd}
  {D:/ESCOM/ARQUITECTURA/ProyectoFinal/Procesador/Procesador.srcs/sources_1/imports/Burbuja Final/DecoInstruc.vhd}
  {D:/ESCOM/ARQUITECTURA/ProyectoFinal/Procesador/Procesador.srcs/sources_1/imports/Burbuja Final/DemuxCodOpera.vhd}
  {D:/ESCOM/ARQUITECTURA/ProyectoFinal/Procesador/Procesador.srcs/sources_1/imports/Burbuja Final/DemuxS.vhd}
  {D:/ESCOM/ARQUITECTURA/ProyectoFinal/Procesador/Procesador.srcs/sources_1/imports/Burbuja Final/MicrocodFuncion.vhd}
  {D:/ESCOM/ARQUITECTURA/ProyectoFinal/Procesador/Procesador.srcs/sources_1/imports/Burbuja Final/MicrocodOperacion.vhd}
  {D:/ESCOM/ARQUITECTURA/ProyectoFinal/Procesador/Procesador.srcs/sources_1/imports/Burbuja Final/Mux16.vhd}
  {D:/ESCOM/ARQUITECTURA/ProyectoFinal/Procesador/Procesador.srcs/sources_1/imports/Burbuja Final/Mux4.vhd}
  {D:/ESCOM/ARQUITECTURA/ProyectoFinal/Procesador/Procesador.srcs/sources_1/imports/Burbuja Final/Nivel.vhd}
  {D:/ESCOM/ARQUITECTURA/ProyectoFinal/Procesador/Procesador.srcs/sources_1/imports/Burbuja Final/RegistroEstado.vhd}
  {D:/ESCOM/ARQUITECTURA/ProyectoFinal/Procesador/Procesador.srcs/sources_1/imports/Burbuja Final/alu.vhd}
  {D:/ESCOM/ARQUITECTURA/ProyectoFinal/Procesador/Procesador.srcs/sources_1/imports/Burbuja Final/archivoReg.vhd}
  {D:/ESCOM/ARQUITECTURA/ProyectoFinal/Procesador/Procesador.srcs/sources_1/imports/Burbuja Final/bs.vhd}
  {D:/ESCOM/ARQUITECTURA/ProyectoFinal/Procesador/Procesador.srcs/sources_1/imports/Burbuja Final/demux.vhd}
  {D:/ESCOM/ARQUITECTURA/ProyectoFinal/Procesador/Procesador.srcs/sources_1/imports/Burbuja Final/extdir.vhd}
  {D:/ESCOM/ARQUITECTURA/ProyectoFinal/Procesador/Procesador.srcs/sources_1/imports/Burbuja Final/extsig.vhd}
  {D:/ESCOM/ARQUITECTURA/ProyectoFinal/Procesador/Procesador.srcs/sources_1/imports/Burbuja Final/main.vhd}
  {D:/ESCOM/ARQUITECTURA/ProyectoFinal/Procesador/Procesador.srcs/sources_1/imports/Burbuja Final/memdatos.vhd}
  {D:/ESCOM/ARQUITECTURA/ProyectoFinal/Procesador/Procesador.srcs/sources_1/imports/Burbuja Final/memoProg.vhd}
  {D:/ESCOM/ARQUITECTURA/ProyectoFinal/Procesador/Procesador.srcs/sources_1/imports/Burbuja Final/multiplexor2.vhd}
  {D:/ESCOM/ARQUITECTURA/ProyectoFinal/Procesador/Procesador.srcs/sources_1/imports/Burbuja Final/pilax.vhd}
  {D:/ESCOM/ARQUITECTURA/ProyectoFinal/Procesador/Procesador.srcs/sources_1/imports/Burbuja Final/procesador.vhd}
  {D:/ESCOM/ARQUITECTURA/ProyectoFinal/Procesador/Procesador.srcs/sources_1/imports/Burbuja Final/registro.vhd}
  {D:/ESCOM/ARQUITECTURA/ProyectoFinal/Procesador/Procesador.srcs/sources_1/imports/Burbuja Final/sim2.vhd}
}
read_edif {{D:/ESCOM/ARQUITECTURA/ProyectoFinal/Procesador/Procesador.srcs/sources_1/imports/Burbuja Final/Procesador.ngc}}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top sim2 -part xc7a100tcsg324-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef sim2.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file sim2_utilization_synth.rpt -pb sim2_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]

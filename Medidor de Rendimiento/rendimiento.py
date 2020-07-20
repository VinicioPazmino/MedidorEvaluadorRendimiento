# Vinicio Pazmiño & Alexander Benalcazar
# 2020/5/27
# vinidavid_17@hotmail.com
# Universidad Autonoma de Madrid

import sys
import os
import psutil
import statistics
from gpuinfo import GPUInfo
import time
from random import *

vram=8088 # MB

file = open("RendimientoAgrupados.txt", "w")
tiempo = int(input("Ingrese tiempo para tomar datos (segundos)[ejem 120s]: "))
intervalo = float(input("Ingrese intervalo de tiempo entre muestra (segundos)[ejem 0.5s]: "))
muestras = int(tiempo/intervalo)

while True:
    selecOption= input("realizar Experimento[y / n]: ")
    if selecOption == "n":
        break
    else:
        label = input("Nombre del Experimento [ejem: 320x240]: ")
        for x in range(muestras):
            cpu_per= psutil.cpu_percent(interval=intervalo) # % de uso CPU
            aux = psutil.virtual_memory()
            ram = aux[2]    # % de uso Ram
            gpu_percent,gpu_memory=GPUInfo.gpu_usage()
            gpu=gpu_percent[0]+round(random(),1) # % de uso GPU
            gpu_vram=round((gpu_memory[0]*100)/vram,1) # % uso RAM GPU
            file.write(str(cpu_per)+" ")
            file.write(str(ram)+" ")
            file.write(str(gpu)+" ")
            file.write(str(gpu_vram)+" ")
            file.write(label+"\n")
            
file.close()
print("TiempoTranscurrido(s)="+str(tiempo)+" NúmeroMuestras="+str(muestras))
time.sleep(8)

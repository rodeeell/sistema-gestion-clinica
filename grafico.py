import mysql.connector
from mysql.connector import Error
import matplotlib
matplotlib.use('TkAgg')
import matplotlib.pyplot as plt

def crea_conexion():
    try:
        conn = mysql.connector.connect(
            host='127.0.0.1',    
            database='clinica',   
            user='root',         
            password='Rororo99!!'          
        )
        if conn.is_connected():
            print(">> Conexión exitosa a la base de datos 'clinica'")
        return conn
    except Error as e:
        print(f"Error al conectar: {e}")
        return None

def generar_grafico_ingresos():
    conn = crea_conexion()
    
    if conn:
        try:
            cursor = conn.cursor()
            
            print(">> Ejecutando SP_REPORTE_INGRESOS_POR_PAGO...")
            cursor.callproc('SP_REPORTE_INGRESOS_POR_PAGO')
            
            resultados = []
            for result in cursor.stored_results():
                resultados.extend(result.fetchall())
            
            if not resultados:
                print("No se encontraron datos para graficar.")
                return

            medios_pago = [fila[0] for fila in resultados]
            montos = [float(fila[1]) for fila in resultados] 

            print(f"Datos recuperados: {resultados}")

            plt.figure(figsize=(10, 6))
            
            barras = plt.bar(medios_pago, montos, color=['#1f77b4', '#ff7f0e', '#2ca02c', '#d62728', '#9467bd'])
        
            plt.title('Total Recaudado por Método de Pago', fontsize=16, fontweight='bold')
            plt.xlabel('Método de Pago', fontsize=12)
            plt.ylabel('Monto Recaudado (CLP)', fontsize=12)
            
            for barra in barras:
                alto = barra.get_height()
                plt.text(barra.get_x() + barra.get_width()/2., 1.01*alto,
                        f'${int(alto):,}',
                        ha='center', va='bottom')

            plt.grid(axis='y', linestyle='--', alpha=0.7)
            plt.tight_layout()

            print(">> Generando gráfico...")
            plt.show()

        except Error as e:
            print(f"Ocurrió un error: {e}")
        finally:
            if cursor: cursor.close()
            conn.close()
            print(">> Conexión cerrada.")

if __name__ == "__main__":
    generar_grafico_ingresos()

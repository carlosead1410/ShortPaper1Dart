// //NOMBRABLE

// // ignore_for_file: non_constant_identifier_names, unnecessary_this

// abstract class Nombrable {
//     String getNombre();
// }

// //UBICACION

// class Ubicacion extends Nombrable {
//     String? pais;
//     String? estado;
//     String? ciudad;

//     Ubicacion(this.pais, this.estado, this.ciudad);

//     @override
//     String getNombre(){
//         return '${this.pais} / ${this.estado} / ${this.ciudad}';
//     }
// }

// //ESPECIALIDADES

// abstract class Especialidad extends Nombrable {
//     examenMedico();
// }

// class Cardiologo implements Especialidad {
//     @override
//     getNombre() {
//         return 'Cardiologo';
//     }
//     @override
//   examenMedico() {
//         //Aqui van las especificaciones medicas tratadas en esta especialidad
//         /* ¡¡¡ ACLARACION !!!: Se sabe que es una muy mala practica instanciar objetos dentro de una clase en si,
//         pero para efectos de esta entrega y la simulacion de este caso de uso, se agilizara el proceso de esta manera
//         rellenando aqui el examen medico */

//         var exMed = {
//             presionArterial: 120,
//             antecedentesPersonales: ['Obesidad'],
//             altura: '1.75 m',
//             peso: '112 kg',
//             colesterol: '95 mg/dl',
//             frecuenciaCardiaca: '75 ppm'
//         }
//         return exMed;
//     }
// }

// class Peidatra implements Especialidad {
//     getNombre() {
//         return 'Pediatra';
//     }
//     examenMedico() {
//         //Aqui van las especificaciones medicas tratadas en esta especialidad
//         return {

//         };
//     }
// }

// export class Neurologo implements Especialidad {
//     getNombre() {
//         return 'Neurologo';
//     }
//     examenMedico() {
//         //Aqui van las especificaciones medicas tratadas en esta especialidad
//         return {

//         };
//     }
// }
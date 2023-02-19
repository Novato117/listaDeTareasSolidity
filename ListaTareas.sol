//SPDX-License-Identifier: MIT

pragma solidity ^0.8.6;

contract tareasContract{
    //para darle id a nuestra tarea
    uint public tareasCount=0;
    //evento de tarea crreada y los datos que debuelve
    event TareaCreada(
        uint256 id,
        string title,
        string descripcion,
        bool done,
        uint256 createAt
    );
    //me debuelve si la tarea esta true o false
    event TaskToggleDone(uint id,bool done);
    //tipos de datos que tendra nuestra tarea,definimos nuestra tarea
    struct Tarea{
        uint256 id;
        string title;
        string descripcion;
        bool done;
        uint256 createAt;
    }
   //mapping de tareas->clave -valor
   /* cada id tendra una tarea
   */
   mapping (uint256 => Tarea) public tarea;
   //constructor() {createTask("my primea tarea", "descripcion");}
   /*
   *funcion para crear tareas
   *la hacemos public para poder ver la funcion pasar datos
   */
   function createTask(string memory _title,string memory _descripcion)public{
      //tareasCount++;
      tarea[tareasCount]=Tarea(tareasCount,_title,_descripcion,false,block.timestamp);
      //emitimos que la tarea se creo
      emit TareaCreada(tareasCount,_title,_descripcion,false,block.timestamp);
      tareasCount++;
   }
   //funcion para actualizar su propiedad si ya se cumplio true o false
   /*
   *le pasamos el id para buscarlo en la lista 
   */
   function toggleDone(uint _id) public {
   //de la tarea quiero el id 1
   //asignamos que es de tipo Task
   Tarea memory _task=tarea[_id];
   _task.done=!_task.done;
   tarea[_id]=_task;
   emit TaskToggleDone(_id,_task.done);
   }

}
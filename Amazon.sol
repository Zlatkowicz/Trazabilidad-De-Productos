// SPDX-License-Identifier: MIT

pragma solidity >= 0.6.0 <= 0.9.0; 

contract Amazon {
    /* La idea sería poder asignar un identificador único a cada producto, el cual serviria para garantizar tanto su autenticidad como el acceso a 
    sus características. Para esto utilizarimos el estándar ERC-721. 
    
    Para los objetos que pertenecen a un grupo y/o coleccion, se les asignaría el estandar ERC-1155. El cuál permite asignarles un identificador
    compartído a cada producto. */

    /* ----------------------------------------------------------------------------------------------------------------------------------------- */
    /* Primer ejemplo: objeto que NO pertenece a una colección. */

    mapping(uint => Producto) Productos;
    struct Producto {
        string nombre;
        address vendedor;
        string categoria;
        uint precio;
        bool envio_gratis;
        bool vendedor_verificado;
    }

    function asignarInformacion(uint _IdProducto, string memory _nombre, address _vendedor, string memory _categoria, uint _precio,
    bool _envio_gratis, bool _vendedor_verificado) public {
        Productos[_IdProducto] = Producto(_nombre, _vendedor, _categoria, _precio, _envio_gratis, _vendedor_verificado);
    }

    function retornarInformacion(uint _IdProducto) public view returns(Producto memory) {
        return Productos[_IdProducto];
    }

    /* ----------------------------------------------------------------------------------------------------------------------------------------- */
    /* Segundo ejemplo: objeto que pertenece a una colección. */

    mapping(uint => Producto2) Productos2;
    struct Producto2 {
        string nombre;
        address vendedor;
        string categoria;
        uint precio;
        bool envio_gratis;
        bool vendedor_verificado;
    }
    Producto2[] public coleccion;

    function asignarInformacion2(uint _IdProducto, string memory _nombre, address _vendedor, string memory _categoria, uint _precio,
    bool _envio_gratis, bool _vendedor_verificado) public {
        Productos2[_IdProducto] = Producto2(_nombre, _vendedor, _categoria, _precio, _envio_gratis, _vendedor_verificado);
        coleccion.push(Producto2(_nombre, _vendedor, _categoria, _precio, _envio_gratis, _vendedor_verificado));
    }
    function retornarValores(uint _posicion) public view returns(Producto2 memory) {
        return coleccion[_posicion];
    }

}
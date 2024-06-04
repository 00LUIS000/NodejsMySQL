// creamos un objeto controler
const controller = {};

controller.buscardocente = (req, res) => {
    const data = req.body.buscar;

    req.getConnection((err, conn) => {

        conn.query(' select * from docentes where Nombre_Docentes = ? or Apellido_Paterno_Docentes = ? or Apellido_Materno_Docentes = ?;',
        [data,data,data], (err, values) => {
            
            if(err){
                res.json(err);
            }
            res.render('docentes',{
                data: values
            });

        });

    })
};

controller.buscarmateria = (req, res) => {
    const data = req.body.buscar;

    req.getConnection((err, conn) => {

        conn.query(' select * from materias where Nombre_Materias = ?;', [data], (err, values) => {
            
            if(err){
                res.json(err);
            }
            res.render('materias',{
                data: values
            });

        });

    })
};

controller.cargar = (req, res) => { 
    res.render('inicio', {
        
    });
};

controller.agregarcomentario = (req, res) => { 
    const {ID_Docente} = req.params;

    req.getConnection((err, conn) => {

        conn.query('SELECT md.ID_Materia, m.Nombre_Materias, md.ID_Docente, d.Nombre_Docentes, d.Apellido_Paterno_Docentes, d.Apellido_Materno_Docentes FROM Materia_Docente md JOIN materias m ON md.ID_Materia = m.ID_Materia JOIN docentes d ON md.ID_Docente = d.ID_Docente where md.ID_Docente = ?', [ID_Docente] , (err, rows) => {
            res.render('agregarcomentario',{
            data: rows
        });
     });
    })
};

controller.comentarios = (req, res) => {
    const data = req.body;
    
    req.getConnection((err, conn) => {

        conn.query('INSERT INTO Comentarios (ID_Usuario, ID_Docente, ID_Materia, Nombre_Materia, Comentario, Calificacion) VALUES (null, ?, null, ?, ?, ?);',
        [data.ID_Docente,data.materia,data.comentario,data.calificacion], (err, values) => {
            
            if(err){
                res.json(err);
            }
            res.redirect('perfildocentes/'+data.ID_Docente);
            
        });

    })
};

controller.detallematerias = (req, res) => { 
    const {ID_Materia} = req.params;
    
    req.getConnection((err, conn) => {

        conn.query('SELECT md.ID_Materia, m.Nombre_Materias, md.ID_Docente, d.Nombre_Docentes, d.Apellido_Paterno_Docentes, d.Apellido_Materno_Docentes FROM Materia_Docente md JOIN materias m ON md.ID_Materia = m.ID_Materia JOIN docentes d ON md.ID_Docente = d.ID_Docente where md.ID_Materia = ?;', [ID_Materia] , (err, rows) => {
            
            res.render('detallemateria',{
            data: rows
        });
        
       });
    })
};

controller.ingresar = (req, res) => {
    datos = req.body;

    req.getConnection((err, conn) => {

        conn.query('SELECT ID_Usuario from usuarios where Correo_Institucional_Usuario = ? and Contraseña_Usuario = ?',[datos.email,datos.password], (err, values) => {
            console.log(values);
            if (values.length > 0) {
                
                res.redirect('/menu');

            }else{

               //CREDENCIALES INCORRECTAS
                
                res.render('inicio',{
                    data : false
                });

            }

        });

    })

};

controller.crearusuario = (req, res) => {
    res.render('crearusuarios', {

    });
};

controller.menu = (req, res) => {
    res.render('menu', {

    });
};

controller.materias = (req, res) => {
    req.getConnection((err, conn) => {

        conn.query('SELECT * FROM materias ORDER BY Nombre_Materias ASC', (err, values) => 
            {

                if(err){
                    res.json(err);
                }
                res.render('materias',{
                    data: values
                });
        
            });

    })
};

controller.perfildocentes = (req, res) => {
    const {ID_Docente} = req.params;
    
    req.getConnection((err, conn) => {
        
        conn.query('SELECT md.ID_Materia, m.Nombre_Materias, md.ID_Docente, d.Nombre_Docentes, d.Apellido_Paterno_Docentes, d.Apellido_Materno_Docentes FROM Materia_Docente md JOIN materias m ON md.ID_Materia = m.ID_Materia JOIN docentes d ON md.ID_Docente = d.ID_Docente where md.ID_Docente = ?',
         [ID_Docente] , (err, rows) => {
            
                //console.log('Los datos de la primera consulta' + rows[0]);

                conn.query('select *from comentarios where ID_Docente = ?',
                 [ID_Docente],(errr,rowss) => {
                    res.render('perfildocentes',{
                        data: rows,
                        comentarios: rowss
                    });
                   // console.log('Los datos de la segunda consulta ' + rowss[0].Calificacion);
                })
        });
        
    })
    
};



controller.agregarusuario = (req, res) => {
    const data = req.body;
    console.log(data); 
    req.getConnection((err, conn) => {

        conn.query('INSERT INTO usuarios values (null,?,?,?)', [data.institucional,data.alternativo,data.password], (err, values) => {
                res.redirect('/menu');
        });

    })

};

controller.recuperar = (req, res) => {
    res.render('recuperarcuenta', {});
};

controller.docentes = (req, res) => {
    req.getConnection((err, conn) => {

        conn.query('SELECT * FROM docentes ORDER BY Nombre_Docentes ASC', (err, values) => 
            {

                if(err){
                    res.json(err);
                }
                res.render('docentes',{
                    data: values
                });
        
            });

    })
     
};

module.exports = controller;

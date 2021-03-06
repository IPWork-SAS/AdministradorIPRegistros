<?php

use Illuminate\Database\Seeder;
use App\Role;

class RolesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $rol = new Role();
        $rol->id = 1;
        $rol->rol = 'Administrador General';
        $rol->save();

        $rol = new Role();
        $rol->id = 2;
        $rol->rol = 'Registrador';
        $rol->save();

        $rol = new Role();
        $rol->id = 3;
        $rol->rol = 'Validador';
        $rol->save();

        $rol = new Role();
        $rol->id = 4;
        $rol->rol = 'Guarda de Seguridad';
        $rol->save();
    }
}

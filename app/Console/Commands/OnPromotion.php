<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Promocion;

class OnPromotion extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'promotion:on';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'habilita las promociones que ya estan disponibles!';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        $promo = new Promocion();
        $promo->promocionOn();
    }
}

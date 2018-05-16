<?php
namespace App\Model\Table;

use Cake\ORM\Table;

class ArticlesTable extends Table
{
    public function initialize(array $config)
    {
        //the Timestamp behavior which will automatically populate the created and modified columns
        $this->addBehavior('Timestamp');
    }
}

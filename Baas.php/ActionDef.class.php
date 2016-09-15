<?php

class ActionDef
{
    public $Name;
    public $Clazz;

    function __construct($name, $clz)
    {
        $this->Name = $name;
        $this->Clazz = $clz;
    }
}

?>
<?php

class DBConfig
{
    public $Name;

    public $Type;

    public $DriverClassName;

    public $UserName;

    public $Password;

    public $MaxActive;

    public $MaxIdle;

    public $Server;
    
    public $Port;

    public $Database;

    public function SetUrl($value)
    {
        $databaseTypeList = array("mysql", "sqlserver", "oracle", "db2", "sybase");
        $target = $value;
        //echo 'Url:'.$value.'<br/>';
        if (!is_numeric($target) && !empty($target))
        {
            $index = stripos($target, "://");
            //echo $index.'<br/>';
            if ($index == -1 || $index == false)
            {
                $index = stripos($target, ":@");
                if ($index == -1)
                {
                    die("The url of connect string is invalid.");
                }
            }
            
            $typeStr = substr($target, 0, $index + 1);
            if (!is_numeric($typeStr) && empty($typeStr))
            {
                die("The connection string is invalid. The database server type doesn't be specified.");
            }
            
            foreach ($databaseTypeList as $item )
            {
                $tempIndex = strpos($typeStr, ":".$item.":");
                //echo $typeStr.'tempIndex:'.$tempIndex.'<br/>';
                if (is_numeric($tempIndex) && $tempIndex != -1)
                {
                    //echo $item.'<br/>';
                    $this->Type = $item;
                    break;
                }
            }
            
            //echo $this->Type;
            $Type = $this->Type;

            if (!is_numeric($Type) && empty($Type))
            {
                echo $target.'<br/>';
                echo 'Type:'.$Type.'<br/>';
                throw new Exception("The specified database server type doesn't be supported.");
            }

            if (in_array($Type, array("mysql", "sqlserver", "sybase", "db2")))
            {
                $server = substr($target, $index + 3);                
                //echo $server;
                if (stripos($server, ':') !== -1)
                {
                    $portStr = $server;
                    $server = substr($server, 0, strpos($server,':'));
                    $port = substr($portStr, strpos($portStr, ':') + 1);
                    $this->Port = substr($port, 0, strpos($port, '/'));
                }
                else
                {
                    $server = substr($server, 0, strpos($server, '/'));
                }
                
                $this->Server = $server;
                $Server = $server;

                if (strrpos($target, '/') !== -1)
                {
                    $database = substr($target, strrpos($target, '/') + 1);                 
                    $semicolonIndex = strpos($database, ';');                    
                    if (is_numeric($semicolonIndex) && $semicolonIndex != -1)
                    {
                        $database = substr($database, 0, $semicolonIndex);
                    }

                    $this->Database = $database;
                }
            }
            else if ($Type == "oracle")
            {
                //echo 'target:'.$target.'<br/>';
                $server = substr($target, $index + 2);
                //echo 'server:'.$server.'<br/>';

                if (strpos($server, ':') == true)
                {
                    $tempStr = $server;
                    $server = substr($server, 0, strpos($server, ':'));
                    $this->Server = $server;
                    $tempStr = substr($tempStr, strpos($tempStr, ":") + 1);
                    if (strpos($tempStr, ':') == true)
                    {
                        $this->Port = substr($tempStr, 0, strpos($tempStr, ':'));
                    }
                }
                else
                {
                    $this->Server = "";
                }
                
                //echo 'server:'.$server.'<br/>';

                //if (strrpos($target, ':') == true)
                {
                    $database = substr($target,strrpos($target, ':') + 1);
                    $semicolonIndex = strpos($database, '@');
                    //echo $semicolonIndex.'database:'.$database.'<br/>';
                    if ($semicolonIndex !== -1)
                    {
                        $database = substr($database, $semicolonIndex);
                    }

                    $this->Database = $database;
                }
            }
            
            //var_dump($this);
        }
    }

    public function ConnectString() {
        return string.Format("Server={0};Uid={1};Pwd={2};Database={3};", $this->Server, $this->UserName, $this->Password, $this->Database);
    }
}

?>
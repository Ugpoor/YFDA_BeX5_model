<?php

require_once("ActionDef.class.php");
require_once("DBConfig.class.php");
require_once('class.phplock.php');

class ActionContext
{
    public $REQUEST = "request";
    public $RESPONSE = "response";

    private static $ConnectionPool = array();
    private static $connectionConfig = null; 

    private  $values = array();

    private $databaseConfig;

    function __construct($databaseConfig)
    {
        //values[REQUEST] = HttpContext.Current.Request;
        //values[RESPONSE] = HttpContext.Current.Response;

        if (!is_numeric($databaseConfig) && empty($databaseConfig))
        {
            throw new Exception("Database config parameter is null.");
        }

        //$this->$databaseConfig = (array)$databaseConfig;
    }

    public function Get($key)
    {
        return $this->$values[$key];
    }

    public function Put($key, $value)
    {
        $this->$values[$key] = $value;
    }

    public function Clear()
    {
        $this->$values->Clear();
    }

    public function ContainsKey($key)
    {
        return $this->$values->ContainsKey($key);
    }

    public function commit()
    {

    }

    public function rollback()
    {

    }

    public function ConnectionConfig()
    {
        //echo 'run ConnectionConfig<br/>';
        if (self::$connectionConfig != null)
        {
            return self::$connectionConfig;
        }
        
        $osSeparator = self::Separator();
        self::$connectionConfig = array();
        $tempArray = array();
        //$tempArray;
        libxml_disable_entity_loader(false);
        $xmlDoc = new DOMDocument();
        $xmlDoc->load(dirname(__FILE__).$osSeparator."config".$osSeparator."db.config.xml");
        //var_dump($xmlDoc);
        $root = $xmlDoc->getElementsByTagName("Resource");
        //var_dump($root);
        //$tempArray['takeout'] = '234';
        //var_dump($tempArray);
        foreach ($root as $node)
        {
            try{
                $config = new DBConfig();                
                $config->Name = strtolower($node->getAttribute("name"));
                $config->DriverClassName = $node->getAttribute("driverClassName");
                $config->SetUrl($node->getAttribute("url"));
                $config->UserName = $node->getAttribute("username");
                $config->Password = $node->getAttribute("password");     
                //$tempArray[$config->Name] = $config;
                self::$connectionConfig[$config->Name] = $config;
                //array_push(self::$connectionConfig, $config->Name, $config);
                //var_dump(self::$connectionConfig);
                //print_r($tempArray);
            }
            catch(Exception $e)
            {
                die($e->getMessage());
            }
        }
        
        //echo 'array:<br/>';
        //print_r(self::$connectionConfig);
        //echo '<br/>';
        return self::$connectionConfig;
    }
    
    public function CreatePDO($config)
    {
        //var_dump($config);
        if (strtolower($config->Type) == "mysql")
        {
            $pdo = new PDO("mysql:host=".$config->Server.";dbname=".$config->Database, $config->UserName, $config->Password, array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES UTF8" ));          
            $pdo->setAttribute ( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
            return $pdo;
        }
        
        if (strtolower($config->Type) == "sqlserver")
        {
            //echo 'Connect to MSSQL server<br/>';        
            //echo "sqlsrv:Server=".$config->Server.";Database=".$config->Database;
            //echo $config->UserName. $config->Password;
            $pdo = new PDO("sqlsrv:Server=".$config->Server.";Database=".$config->Database, $config->UserName, $config->Password);
            //$pdo->setAttribute ( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
            //var_dump($pdo);
            return $pdo;
        }      
        
        if (strtolower($config->Type) == "oracle")
        {
            $tns = "  
            (DESCRIPTION =
                (ADDRESS_LIST =
                  (ADDRESS = (PROTOCOL = TCP)(HOST = 127.0.0.1)(PORT = ".$config->Port."))
                )
                (CONNECT_DATA =
                  (SERVICE_NAME = ".$config->Database.")
                )
            )";
            //echo $tns;
            //phpinfo();
            //foreach(PDO::getAvailableDrivers() as $driver)
            //    echo $driver, '<br>';
            
            try {
                //$conn = oci_connect("system", "x5", "takeout");
                $pdo = new PDO("oci:dbname=".$config->Database.";host=".$config->Server.";charset=zhs16gbk", $config->UserName, $config->Password);     
                //$pdo = new PDO("oci:dbname=".$tns, $config->UserName, $config->Password); 
            }
            catch(Exception $e)
            {
                die($e->getMessage());
            }
            return $pdo;
        }
        
        return null;
    }

    public function Connection($datasource)
    {
        if (!is_numeric($datasource) && !empty($datasource))
        {
            if (array_key_exists($datasource, self::$ConnectionPool))
            {
                return self::$ConnectionPool[$datasource];
            }
            
            $lock = new PHPLock('lock/', 'lockname' );
            $lock->startLock();
            
            if (!array_key_exists($datasource, self::$ConnectionPool))
            {
                try
                {
                    //var_dump($this->ConnectionConfig());
                    $tempArray = $this->ConnectionConfig();
                    //var_dump($tempArray);
                    //echo 'exists key: '.(array_key_exists($datasource, $tempArray) === false).'<br/>';
                    if (array_key_exists($datasource, $tempArray) == true)
                    {
                        //echo $datasource.'<br/>';
                        self::$ConnectionPool[$datasource] = $this->CreatePDO(self::ConnectionConfig()[$datasource]);
                    }
                }
                catch (Exception $e)
                {
                    //die($e->getMessage());
                    return null;
                }
            }
                
            $lock->unlock();
            $lock->endLock();
            
            if (array_key_exists($datasource, self::$ConnectionPool))
            {
                return self::$ConnectionPool[$datasource];
            }
            
            return null;
        }

        return null;
    }
    
    public function Separator()
    {
        $os_name = php_uname('s');
        //echo $os_name;
        if ($os_name == 'Darwin')
        {
            return '/';
        }
        elseif (strpos($os_name, 'Windows') != -1)
        {
            return '/';
        }
        else
        {
            return '/';
        }
    }
}

?>
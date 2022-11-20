<?php 
    Class Order
    {
        protected $conn;
        protected $table_name = "order0";

        protected $user_ID;
        protected $total_price;
        protected $date_hour_sale;
        protected $break_ID;
        protected $status_ID;
        protected $pickup_ID;
        protected $json;

        public function __construct($db)
        {
            $this->conn = $db;
        }

        function getArchiveOrder()
        {
            $query = "SELECT * FROM $this->table_name";

            $stmt = $this->conn->query($query);

            return $stmt;
        }

        function getOrder($id)
        {
            $query = "SELECT * FROM $this->table_name WHERE ID = $id";

            $stmt = $this->conn->query($query);

            return $stmt;
        }

        function delete($id){

            $query = "UPDATE $this->table_name SET status_ID = 2 WHERE ID = $id";

            $stmt = $this->conn->query($query);

            return $stmt;
        }
    }
?>
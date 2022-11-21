<?php 
    Class OrderProduct
    {
        protected $conn;
        protected $table_name = "order_product";

        protected $user_ID;
        protected $product_ID;

        public function __construct($db)
        {
            $this->conn = $db;
        }

        function setOrderProduct($order_ID, $products)
        {
            $query = "INSERT INTO $this->table_name (order_ID, product_ID, quantity) VALUES (?, ?, ?)";
            $stmt = $this->conn->prepare($query);

            foreach(json_decode($products, true) as $product)
            {
                $stmt->bind_param('iii', $order_ID, $product['ID'], $product['quantity']);
                $stmt->execute();
            }
        }

        function getOrderProduct($order_ID)
        {
            $query = "SELECT * FROM $this->table_name WHERE order_ID = $order_ID";

            $stmt = $this->conn->query($query);

            return $stmt;
        }
    }
?>
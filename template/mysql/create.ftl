CREATE TABLE `ka_log_reward_log` (          
                     `id` int(11) NOT NULL AUTO_INCREMENT,     
                     `member_id` int(11) NOT NULL,             
                     `nick_name` varchar(50) DEFAULT NULL,     
                     `amount` decimal(10,2) NOT NULL,          
                     `create_time` datetime NOT NULL,          
                     `mode` varchar(50) NOT NULL,              
                     `subject_id` varchar(50) DEFAULT NULL,    
                     `subject_name` varchar(50) DEFAULT NULL,  
                     PRIMARY KEY (`id`)                        
                   ) ENGINE=InnoDB DEFAULT CHARSET=utf8
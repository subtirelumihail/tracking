<?php

class Tracking extends CI_Controller {
	var $trackTable = 'track_users';
    var $eventTable = 'track_events';

	var $navigator;
	var $navagent;
	var $USER;
	var $json;
	var $IP;

	public function guint(){
		$this->navigator = file_get_contents("php://input");
		$this->json 	 = json_decode($this->navigator);
		$this->navagent  = $this->json->navigator->userAgent;
		
		$navigator 		 = json_decode(json_encode($this->json), true);
		$this->navigator = json_encode($navigator['navigator']);

		$this->USER = $this->checkUser();
	}
	
	private function checkUser(){
		$this->IP = $_SERVER['REMOTE_ADDR'];

		$checkSQL = "SELECT id FROM $this->trackTable WHERE ip=? AND navagent=? LIMIT 1";
		$qCheck   = $this->db->query($checkSQL, array($this->IP, $this->navagent ));

		return $qCheck->num_rows() > 0 ? $qCheck->row_array() : $this->insertUser();
	}

	private function insertUser(){
		$insertSQL = "INSERT IGNORE INTO $this->trackTable(ip, navigator, navagent) VALUES(?,?,?)";
		$qinsert   = $this->db->query($insertSQL, array($this->IP, $this->navigator, $this->navagent));

		return $qinsert ? array('id'=>$this->db->insert_id()) : die('Error in inserting user');
	}

	public function setEvent(){
		$this->guint();

		$user = $this->USER;

		$insertSQL = "INSERT IGNORE INTO $this->eventTable(idUSER, trackName, eventName, eventVals) VALUES(?,?,?,?)";
		$qinsert   = $this->db->query($insertSQL, array($user['id'], $this->json->Track, $this->json->Evnt, $this->json->EvntVal));

		echo $this->db->insert_id();
	}
}

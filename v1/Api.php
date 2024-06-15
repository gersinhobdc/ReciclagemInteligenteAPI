<?php 

	require_once '../includes/DbReciclagem.php';

	function isTheseParametersAvailable($params){
	
		$available = true; 
		$missingparams = ""; 
		
		foreach($params as $param){
			if(!isset($_POST[$param]) || strlen($_POST[$param])<=0){
				$available = false; 
				$missingparams = $missingparams . ", " . $param; 
			}
		}
		
		
		if(!$available){
			$response = array(); 
			$response['error'] = true; 
			$response['message'] = 'Parameters ' . substr($missingparams, 1, strlen($missingparams)) . ' missing';
			
		
			echo json_encode($response);
			
		
			die();
		}
	}
	
	
	$response = array();
	

	if(isset($_GET['apicall'])){
		
		switch($_GET['apicall']){
	
			case 'createuser':
				
				isTheseParametersAvailable(array('Nome','Email','CPF','Endereco','Senha'));
				
				$db = new dbReciclagem();
				
				$result = $db->createUser(
					$_POST['Nome'],
					$_POST['Email'],
					$_POST['CPF'],
					$_POST['Endereco']
					$_POST['Senha']
				);
				

			
				if($result){
					
					$response['error'] = false; 

					
					$response['message'] = 'Usuário adicionado com sucesso';

					
					$response['users'] = $db->getUser();
				}else{

					
					$response['error'] = true; 

				
					$response['message'] = 'Algum erro ocorreu por favor tente novamente';
				}
				
			break; 
			
		
			case 'getuser':
				$db = new dbReciclagem();
				$response['error'] = false; 
				$response['message'] = 'Pedido concluído com sucesso';
				$response['users'] = $db->getUser();
			break; 
			
			
		
			case 'updateuser':
				isTheseParametersAvailable(array('id','Nome','Email','CPF','Endereco','Senha'));
				$db = new dbReciclagem();
				$result = $db->updateUser(
					$_POST['Nome'],
					$_POST['Email'],
					$_POST['CPF'],
					$_POST['Endereco']
					$_POST['Senha']
				);
				
				if($result){
					$response['error'] = false; 
					$response['message'] = 'Usuário atualizado com sucesso';
					$response['users'] = $db->getUser();
				}else{
					$response['error'] = true; 
					$response['message'] = 'Algum erro ocorreu por favor tente novamente';
				}
			break; 
			
			
			case 'deleteuser':

				
				if(isset($_GET['id'])){
					$db = new dbReciclagem();
					if($db->deleteUser($_GET['id'])){
						$response['error'] = false; 
						$response['message'] = 'Usuário excluído com sucesso';
						$response['users'] = $db->getUser();
					}else{
						$response['error'] = true; 
						$response['message'] = 'Algum erro ocorreu por favor tente novamente';
					}
				}else{
					$response['error'] = true; 
					$response['message'] = 'Não foi possível deletar, forneça um id por favor';
				}
			break; 
		}
		
	}else{
		 
		$response['error'] = true; 
		$response['message'] = 'Chamada de API inválida';
	}
	

	echo json_encode($response);
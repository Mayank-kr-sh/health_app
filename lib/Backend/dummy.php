<!-- <?php

// Read the request body
$requestBody = file_get_contents('php://input');
$requestData = json_decode($requestBody, true);

// Prepare response data (dummy user details)
$responseData = array();
foreach ($requestData['users'] as $user) {
    $userDetails = array('id' => $user['id'], 'name' => $user['name']);
    $responseData[] = $userDetails;
}

header('Content-Type: application/json');
echo json_encode($responseData); -->

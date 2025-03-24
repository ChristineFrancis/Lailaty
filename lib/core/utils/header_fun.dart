Map<String, String>? getHeader(bool hasToken) {
  if (hasToken == false) {
    return {
      'Accept': 'application/json',
    };
  } else {
    return {
      'Accept': 'application/json',
      'Authorization':
          'Bearer 173|5rzNhelOPn0WKBWEM99XH9Hcvw9KZHhdtAnepOTu8dc7e8cd',
    };
  }
}

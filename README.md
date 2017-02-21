Bluecoat proxy has an issue where websites in the "undefined" category end up blocking the response from the destination server not the request going out. The end user still sees a "blocked" page message but the request still hits the destination server. This can allow attackers to bypass enterprise filter controls and exfil compromised data out of the organization.

Leaky will read a file, b64 encode it and append it to a URL GET request. The end server needs to be able to decode the URL request and save the data to a file.

// getHeader(bool userToken) {
//   if (userToken) {
//     return Options(headers: {
//       'Authorization': 'Bearer ${config.get<SharedPreferences>().getString(
//             'token',
//           )}',
//       "contentType": "application/json",
//     });
//   } else {
//     return Options(headers: {
//       "contentType": "application/json",
//     });
//   }
// }
//? using it with dio
    // options: getHeader(true).copyWith(validateStatus: (int? status) {
    //         return status != null && status < 500;
    //       }),
function allContacts() {
  let userId = $("form").data().userId;

  axios({
    method: 'get',
    url: '/api/v1/contacts'
  }).then(createEachContactHTML).then(renderContacts)
}

function createEachContactHTML(contactsData) {
  return contactsData.data.map(createAllContactHTML);
}

function createAllContactHTML( createEachContactHTML ) {
  let contact = createEachContactHTML
  return $(
    `<tr id='${contact.id}' class='contact'>
      <td>${contact.first_name}</td>
      <td>${contact.last_name}</td>
      <td>${contact.email}</td>
      <td>${contact.phone}</td>
      <td>${contact.linked_in}</td>
      <td>${contact.twitter}</td>
      <td>${contact.other}</td>
    </tr>`
  )
}

function renderContacts(contactsData) {
  $("#list-of-contacts").html(contactsData);
  allMonths();
}

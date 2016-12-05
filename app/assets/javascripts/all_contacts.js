function allContacts() {

  // multiple concurrent axios requests for contacts and months

  axios.all([getContacts(), getMonths()])
    .then(axios.spread(function (contactsData, monthsData) {
      //... but this callback will be executed only when both requests are complete.

    console.log('Contact', contactsData.data);
    console.log('Months', monthsData.data);

    renderContacts(createEachContactHTML(contactsData, monthsData));
    renderContactMonths(createEachContactMonthHTML(monthsData));
    })
  );
}

function getContacts() {
  return axios.get('/api/v1/contacts')
}

function getMonths() {
  return axios.get('/api/v1/months');
}

// create and render HTML for all contacts

function createEachContactHTML(contactsData, monthsData) {
  let contacts =  contactsData.data.map(createAllContactHTML);
  return contacts
}

// function createEachContactHTML(contactsData, monthsData) {
//   let months = monthsData
//   let contacts =  contactsData.data.map(function(contact) {
//     debugger
//     createAllContactHTML(contact);
//   })
//   return contacts
// }


function createAllContactHTML(contactData) {
  let contact = contactData

  return $(
    `<tr id='${contact.id} 'class='contact'>
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
}

// create and append HTML for all contact months

function createEachContactMonthHTML(monthsData) {
  return monthsData.data.map(createAllContactMonthHTML);
}

function createAllContactMonthHTML( monthData ) {
  let month = monthData[0]
  const days = [...Array(31).keys()];

  return $(
    `
      <td>${month.method}</td>
      <td>${month.date}</td>
      <td>${month.meeting}</td>
      <td>${month.meeting_date}</td>
    `
  )
}

function renderContactMonths(monthsData, contactsData) {
  monthsData.forEach(function(month) {
    $(".contact").append(month);
  })
}

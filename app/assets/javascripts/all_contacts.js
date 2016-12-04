function allContacts() {

  // multiple concurrent axios requests for contacts and months

  axios.all([getContacts(), getMonths()])
    .then(axios.spread(function (contactsData, monthsData) {
      //... but this callback will be executed only when both requests are complete.

    console.log('Contact', contactsData.data);
    console.log('Months', monthsData.data);

    renderContacts(createEachContactHTML(contactsData));
    createEachContactMonthHTML(monthsData, contactsData);
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
  return contactsData.data.map(createAllContactHTML);
}

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
      <td >${contact.other}</td>
    </tr>`
  )
}

function renderContacts(contactsData) {
  $("#list-of-contacts").html(contactsData);
}

// create and append HTML for all contact months

function createEachContactMonthHTML(monthsData, contactsData) {
    $(".contact").append(monthsData.data.map(createAllContactMonthHTML));
}

function createAllContactMonthHTML( createEachContactMonthHTML ) {
  let month = createEachContactMonthHTML[0]
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
    contactsData.data.forEach(function(contact){
      $(`#${contact.id}`).append("hello");
    })
  })
}

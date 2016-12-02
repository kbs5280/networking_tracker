function allMonths() {
  axios({
    method: 'get',
    url: '/api/v1/months'
  }).then(createEachContactMonthHTML).then(renderContactMonths)
}

function createEachContactMonthHTML(monthData) {
  return monthData.data.map(createMonthHTML);
}

function createMonthHTML( createEachContactMonthHTML ) {
  let month = createEachContactMonthHTML[0]
  const days = [...Array(31).keys()];

  return $(
    `<tr>
      <td>
        <select>
          <option>${month.method}</option>
          <option>n/a</option>
          <option>Email</option>
          <option>Phone</option>
          <option>Person</option>
        </select>
      </td>
      <td>
        <select>
          <option>${month.date.slice(8, 10)}</option>

          ${days.forEach(function (day){
            return `<option>${day}</option>`
          })}
        </select>
      </td>
      <td>${month.meeting}</td>
      <td>${month.meeting_date.slice(8, 10)}</td>
    </tr>
    `
  )
}

function renderContactMonths(monthsData) {
  // debugger;
  // $(monthsData[0]).appendTo($("#table>tbody>tr:last"))
  $("#list-of-contact-months").html(monthsData);
}

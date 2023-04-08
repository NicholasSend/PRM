$('tr').click(function (e) {
  let target = e.target
  while (target.tagName !== 'TR') {
    target = target.parentElement
  }

  window.location.href = '/person/' + encodeURIComponent(target.childNodes[0].textContent)
})

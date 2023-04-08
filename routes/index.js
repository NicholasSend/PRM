const express = require('express')
const router = express.Router()
const db = require('better-sqlite3')('PersonalRelationshipManagerDB.db')

/* GET home page. */
router.get('/', function (req, res, next) {
  const contactData = db.prepare('SELECT * from Contact natural join (select company_name, company_id from Company)').all()

  res.render('index', {
    title: 'Contact Information',
    data: contactData
  })
})

router.get('/reminders', function (req, res, next) {
  const reminderData = db.prepare('SELECT * from ((select contact_name, contact_id, reminder_id from Contact natural join reminder_contact_map) natural join Reminders)').all()

  res.render('reminders', {
    title: 'Reminders',
    data: reminderData
  })
})

router.get('/company', function (req, res, next) {
  const companyData = db.prepare('SELECT * from Company').all()

  res.render('company', {
    title: 'Company Information',
    data: companyData
  })
})

router.get('/person/:contact_id', function (req, res, next) {
  const companyData = db.prepare('SELECT * from Contact natural join (select company_name, company_id from Company) where contact_id = ?').get(req.params.contact_id)
  const acquaintanceData = db.prepare('SELECT * from (select relationship_type as acquaintance_type, acquaintance_id as contact_id from contact_acquaintances where contact_id = ?) as t natural join Contact').all(req.params.contact_id)
  const interactionData = db.prepare('SELECT * from Interactions where contact_id = ?').all(req.params.contact_id)
  const reminderData = db.prepare('SELECT * from ((select contact_name, contact_id, reminder_id from Contact natural join reminder_contact_map) natural join Reminders) where contact_id = ?').all(req.params.contact_id)

  res.render('person', {
    title: companyData.contact_name,
    data: companyData,
    aData: acquaintanceData,
    iData: interactionData,
    rData: reminderData
  })
})

module.exports = router

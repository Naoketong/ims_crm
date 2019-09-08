module.exports = function (req, res, next) {
  res.locals.seo = {
    title: '',
    keywords: 'crm',
    description: 'ims_crm'
  }

  next();
}
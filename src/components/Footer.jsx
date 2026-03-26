import './Footer.css'

function Footer() {
  return (
    <footer className="footer">
      <span className="footer-name">Luke Solomon</span>
      <span className="footer-year">&copy; {new Date().getFullYear()}</span>
    </footer>
  )
}

export default Footer

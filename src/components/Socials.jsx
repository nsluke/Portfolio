import './Socials.css'

const links = [
  { name: 'GitHub', url: 'https://github.com/nsluke' },
  { name: 'YouTube', url: '#' },
  { name: 'Instagram', url: '#' },
  { name: 'X / Twitter', url: 'https://twitter.com/_luke_warm' },
  { name: 'LinkedIn', url: '#' },
  { name: 'Email', url: 'mailto:solomora@gmail.com' },
]

function Socials() {
  return (
    <section className="socials">
      <div className="socials-header">
        <span className="section-label">Connect</span>
      </div>
      <div className="socials-grid">
        {links.map((link) => (
          <a
            key={link.name}
            href={link.url}
            target="_blank"
            rel="noopener noreferrer"
            className="social-link"
          >
            <span className="social-name">{link.name}</span>
            <span className="social-arrow">-&gt;</span>
          </a>
        ))}
      </div>
    </section>
  )
}

export default Socials

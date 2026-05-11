import { useEffect } from 'react'
import { Link } from 'react-router-dom'
import resume from '../data/resume.json'
import Footer from '../components/Footer'
import './Resume.css'

function formatDate(iso) {
  if (!iso) return 'Present'
  const [y, m] = iso.split('-')
  if (!m) return y
  const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
  return `${months[parseInt(m, 10) - 1]} ${y}`
}

function dateRange(startDate, endDate) {
  const start = formatDate(startDate)
  const end = endDate ? formatDate(endDate) : 'Present'
  return `${start} — ${end}`
}

function Section({ label, count, children }) {
  return (
    <section className="resume-section">
      <div className="resume-section-header">
        <span className="section-label">{label}</span>
        {count != null && <span className="resume-section-count">{count}</span>}
      </div>
      <div className="resume-section-body">{children}</div>
    </section>
  )
}

function Resume() {
  const { basics, work, education, skills, projects, interests } = resume

  useEffect(() => {
    if (typeof window.gtag === 'function') {
      window.gtag('event', 'resume_viewed')
    }
  }, [])

  return (
    <div className="resume-page">
      <nav className="resume-nav">
        <Link to="/" className="resume-back">&larr; Back</Link>
        <a
          href="/resume.pdf"
          className="resume-download"
          target="_blank"
          rel="noopener noreferrer"
        >
          Download PDF -&gt;
        </a>
      </nav>

      <header className="resume-hero">
        <h1 className="resume-name">{basics.name}</h1>
        <p className="resume-label">{basics.label}</p>
        <div className="resume-contact">
          {basics.location && (
            <span>{[basics.location.city, basics.location.region].filter(Boolean).join(', ')}</span>
          )}
          {basics.email && (
            <a href={`mailto:${basics.email}`} className="resume-contact-link">{basics.email}</a>
          )}
          {basics.phone && <span>{basics.phone}</span>}
        </div>
        {basics.summary && <p className="resume-summary">{basics.summary}</p>}
        {basics.profiles?.length > 0 && (
          <div className="resume-profiles">
            {basics.profiles.map((p) => (
              <a
                key={p.network}
                href={p.url}
                target="_blank"
                rel="noopener noreferrer"
                className="resume-profile-link"
              >
                {p.network} -&gt;
              </a>
            ))}
          </div>
        )}
      </header>

      <Section label="Experience" count={work?.length}>
        {work?.map((job, i) => (
          <article key={`${job.name}-${i}`} className="resume-row">
            <div className="resume-row-index">{String(i + 1).padStart(2, '0')}</div>
            <div className="resume-row-body">
              <div className="resume-row-head">
                <h3 className="resume-row-title">
                  {job.position} <span className="resume-row-at">@ {job.name}</span>
                </h3>
                <span className="resume-row-date">{dateRange(job.startDate, job.endDate)}</span>
              </div>
              {job.highlights?.length > 0 && (
                <ul className="resume-bullets">
                  {job.highlights.map((h, j) => (
                    <li key={j}>{h}</li>
                  ))}
                </ul>
              )}
            </div>
          </article>
        ))}
      </Section>

      <Section label="Projects" count={projects?.length}>
        {projects?.map((p, i) => (
          <article key={p.name} className="resume-row">
            <div className="resume-row-index">{String(i + 1).padStart(2, '0')}</div>
            <div className="resume-row-body">
              <div className="resume-row-head">
                <h3 className="resume-row-title">
                  {p.name}
                  {p.type && <span className="resume-row-at"> · {p.type}</span>}
                </h3>
                {p.url && (
                  <a
                    href={p.url}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="resume-row-link"
                  >
                    Visit -&gt;
                  </a>
                )}
              </div>
              {p.description && <p className="resume-row-desc">{p.description}</p>}
              {p.keywords?.length > 0 && (
                <div className="resume-tags">
                  {p.keywords.map((k) => (
                    <span key={k} className="resume-tag">{k}</span>
                  ))}
                </div>
              )}
            </div>
          </article>
        ))}
      </Section>

      <Section label="Skills" count={skills?.length}>
        <div className="resume-skills">
          {skills?.map((group) => (
            <div key={group.name} className="resume-skill-group">
              <h4 className="resume-skill-heading">{group.name}</h4>
              <div className="resume-tags">
                {group.keywords?.map((k) => (
                  <span key={k} className="resume-tag">{k}</span>
                ))}
              </div>
            </div>
          ))}
        </div>
      </Section>

      <Section label="Education" count={education?.length}>
        {education?.map((ed, i) => (
          <article key={`${ed.institution}-${i}`} className="resume-row">
            <div className="resume-row-index">{String(i + 1).padStart(2, '0')}</div>
            <div className="resume-row-body">
              <div className="resume-row-head">
                <h3 className="resume-row-title">
                  {ed.institution}
                  {ed.area && <span className="resume-row-at"> · {ed.area}</span>}
                </h3>
                <span className="resume-row-date">{dateRange(ed.startDate, ed.endDate)}</span>
              </div>
              {ed.studyType && <p className="resume-row-desc">{ed.studyType}</p>}
            </div>
          </article>
        ))}
      </Section>

      {interests?.length > 0 && (
        <Section label="Interests">
          <div className="resume-skills">
            {interests.map((group) => (
              <div key={group.name} className="resume-skill-group">
                <h4 className="resume-skill-heading">{group.name}</h4>
                <div className="resume-tags">
                  {group.keywords?.map((k) => (
                    <span key={k} className="resume-tag">{k}</span>
                  ))}
                </div>
              </div>
            ))}
          </div>
        </Section>
      )}

      <Footer />
    </div>
  )
}

export default Resume

import './Marquee.css'

function Marquee({ text }) {
  const repeated = `${text} `.repeat(8)
  return (
    <div className="marquee">
      <div className="marquee-track">
        <span className="marquee-text">{repeated}</span>
        <span className="marquee-text" aria-hidden="true">{repeated}</span>
      </div>
    </div>
  )
}

export default Marquee

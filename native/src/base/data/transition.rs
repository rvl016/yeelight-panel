use std::time::Duration;


#[derive(Default, Debug)]
pub struct Transition {
    pub effect: TransitionEffect,
    pub duration: Duration,
}

#[derive(Default, Debug)]
pub enum TransitionEffect {
    #[default] Smooth,
    Sudden,
}

pub const DEFAULT_TRANSITION: Transition = Transition {
    effect: TransitionEffect::Smooth,
    duration: Duration::from_millis(250)
};
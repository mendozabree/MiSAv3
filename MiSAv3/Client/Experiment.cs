using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MiSAv3.Client
{
    public class Experiment
    {
        private int experimentID;  // the experimentID field
        public int ExperimentID    // the experimentID property
        {
            get
            {
                return experimentID;
            }
            set
            {
                experimentID = value;
            }
        }
    }
}